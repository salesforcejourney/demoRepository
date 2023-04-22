import { LightningElement, api } from "lwc";

export default class ChildApi extends LightningElement {
  @api message;

  @api
  showMessage(message) {
    alert(message);
  }
}
