require("ollama").setup({
    model = "dolphin2.2-mistral",
    url = "http://192.168.1.111:5050",
    serve = {
        on_start = false,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
    },
    prompts = {
        Sample_Prompt = {
            prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
            input_label = "> ",
            model = "dolphin2.2-mistral",
            action = "display",
        }
    }
})
