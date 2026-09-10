use dioxus_native::prelude::*;
use ui::App;

#[cfg(target_os = "android")]
#[unsafe(no_mangle)]
fn android_main(app: android_activity::AndroidApp) {

    android_logger::init_once(
        android_logger::Config::default().with_max_level(log::LevelFilter::Info),
    );
    
    dioxus_native::launch(App);
}

#[cfg(target_os = "android")]
fn main() {}

#[cfg(not(target_os = "android"))]
fn main() {

    #[cfg(target_os = "linux")]
    unsafe {
        std::env::set_var("WEBKIT_DISABLE_DMABUF_RENDERER", "1");
        std::env::set_var("WGPU_BACKEND", "vulkan");
    }

    dioxus_native::launch(App);

}