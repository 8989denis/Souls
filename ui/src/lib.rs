use dioxus::prelude::*;

#[component]
pub fn App() -> Element {
    rsx! {
        document::Stylesheet { href: asset!("/assets/tailwind.css") }
        div { class: "flex flex-col items-center p-4",
            h1 { class: "text-2xl font-bold", "Messenger P2P" }
            ChatList {}
        }
    }
}

#[component]
pub fn ChatList() -> Element {
    rsx! {
        div { class: "flex flex-col gap-2",
            "Wiadomości..."
        }
    }
}