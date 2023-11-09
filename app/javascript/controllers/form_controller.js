import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetComponent(){
    const form = this.element;

    const timer = setInterval(() => {
      form.reset();
    },100);
  }
}