let lastTheme = "";

async function syncTheme() {
  try {
    const theme = await browser.runtime.sendNativeMessage("local.yavaos.firefox_theme", { action: "read" });
    if (theme.error) throw new Error(theme.error);
    const serialized = JSON.stringify(theme);
    if (serialized !== lastTheme) {
      await browser.theme.update(theme);
      lastTheme = serialized;
    }
  } catch (error) {
    console.error("YavaOS theme sync:", error);
  }
}

syncTheme();
setInterval(syncTheme, 2000);
