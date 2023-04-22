import { LightningElement } from "lwc";

export default class ParentApi extends LightningElement {
  clickhandler(event) {
    // this.refs.mychild.showMessage("Hello from parent component");
    this.template
      .querySelector("c-child-api")
      .showMessage("Hello from parent component");
  }
}
