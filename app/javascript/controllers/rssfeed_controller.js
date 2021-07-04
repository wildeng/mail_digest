// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "links", "template" ];

  connect() {
    this.wrapperClass = this.data.get("wrapperClass") || "rssfeed"
    console.log(this.wrapperClass)
  }

  remove_association(event) {
    event.preventDefault();

    let wrapper = event.target.closest("." + this.wrapperClass)

    // New records are simply removed from the page
    if (wrapper.dataset.newRecord == "true") {
      wrapper.remove()

    // Existing records are hidden and flagged for deletion
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = 'none'
    }
  }

  add_association(event) {
    console.log(event);
    event.preventDefault();
    var content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.linksTarget.insertAdjacentHTML('beforebegin', content);
  }
}
