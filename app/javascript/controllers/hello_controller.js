import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.formatTimes()
  }
  formatTimes() {
    this.element.querySelectorAll("td[data-utc-time]").forEach((element) => {
      const utcTime = element.getAttribute("data-utc-time");
      const localTime = new Date(utcTime).toLocaleString([], {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
      });
      element.textContent = localTime;
    });
  }
}
