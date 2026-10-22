{
  "manifest_version": 3,
  "name": "YavaOS Theme",
  "version": "1.0.0",
  "description": "Chrome colors from the current YavaOS theme.",
  "theme": {
    "colors": {
      "frame": [{{ dark_background_rgb }}],
      "frame_inactive": [{{ darker_background_rgb }}],
      "toolbar": [{{ background_rgb }}],
      "tab_text": [{{ accent_rgb }}],
      "tab_background_text": [{{ light_foreground_rgb }}],
      "bookmark_text": [{{ foreground_rgb }}],
      "ntp_background": [{{ background_rgb }}],
      "ntp_text": [{{ foreground_rgb }}],
      "ntp_link": [{{ accent_rgb }}],
      "button_background": [{{ background_rgb }}]
    }
  }
}
