#[cfg(feature = "web")]
use dioxus::prelude::*;

#[cfg(feature = "native")]
use dioxus_native::prelude::*;

#[component]
pub fn App() -> Element {
    rsx! {
        document::Stylesheet { href: asset!("/assets/tailwind.css") }
        div { class: "flex flex-col items-center p-4",
            h1 { class: "text-2xl font-bold", "Messenger P2P" }
        }
    }
}