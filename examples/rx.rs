
#![no_std]
#![no_main]

use cortex_m_rt::entry;
use defmt::*;
use defmt_rtt as _;
use embedded_hal::{
    digital::v2::OutputPin,
    spi::MODE_0,
};
use embedded_time::{
    fixed_point::FixedPoint,
    rate::*,
};

use hal::{
    pac,
    clocks::{init_clocks_and_plls, Clock},
    sio::Sio,
    gpio::{
        Pins,
        FunctionSpi,
    },
    spi::Spi,
    watchdog::Watchdog,
};

use nb::block;

use panic_probe as _;
use rp2040_hal as hal;

use dw1000::{
    DW1000,
    RxConfig,
    ranging::{
        self,
        Message as _,
    },
};

#[link_section = ".boot2"]
#[used]
pub static BOOT2: [u8; 256] = rp2040_boot2::BOOT_LOADER_W25Q080;

#[entry]
fn main() -> ! {
    let mut peripherals = pac::Peripherals::take().unwrap();
    let core = pac::CorePeripherals::take().unwrap();
    let mut watchdog = Watchdog::new(peripherals.WATCHDOG);
    let sio = Sio::new(peripherals.SIO);
    let pins = Pins::new(peripherals.IO_BANK0, peripherals.PADS_BANK0, sio.gpio_bank0, &mut peripherals.RESETS);

    let external_xtal_freq_hz = 12_000_000u32;
    let clocks = init_clocks_and_plls(
        external_xtal_freq_hz,
        peripherals.XOSC,
        peripherals.CLOCKS,
        peripherals.PLL_SYS,
        peripherals.PLL_USB,
        &mut peripherals.RESETS,
        &mut watchdog,
    )
    .ok()
    .unwrap();

    let mut delay = cortex_m::delay::Delay::new(core.SYST, clocks.system_clock.freq().integer());

    let _ = pins.gpio4.into_mode::<FunctionSpi>();
    // let _ = pins.gpio1.into_mode::<FunctionSpi>();
    let _ = pins.gpio6.into_mode::<FunctionSpi>();
    let _ = pins.gpio7.into_mode::<FunctionSpi>();

    let dw1000_spi = Spi::<_, _, 8>::new(peripherals.SPI0)
        .init(&mut peripherals.RESETS, 125_000_000.Hz(), 2_000_000.Hz(), &MODE_0);
    
    let dw1000 = DW1000::new(dw1000_spi, pins.gpio5.into_push_pull_output())
        .init().expect("Could not initialize dw1000");

    let mut led_pin = pins.gpio25.into_push_pull_output();

    let mut receiving = dw1000
        .receive(RxConfig {
            frame_filtering: false,
            .. RxConfig::default()
        })
        .expect("Could not start receiver");

    info!("Receiving messages...");
    loop {
        led_pin.set_low().unwrap();

        let mut message_buffer = [0; 1024];
        if block!(receiving.wait(&mut message_buffer)).is_err() {
            info!("receive failed. Looping around");
            led_pin.set_high().unwrap();
            delay.delay_ms(500);
            continue;
        }

        info!("Message received!!!");
        led_pin.set_high().unwrap();
        delay.delay_ms(5000);
    }

}
