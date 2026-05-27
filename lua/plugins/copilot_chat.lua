return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      chat = {
        openai_model = "gpt-5.5-turbo",
        openai_params = {
          temperature = 0.7,
          top_p = 1,
          frequency_penalty = 0,
          presence_penalty = 0,
        },
      },
    },
  },
}
