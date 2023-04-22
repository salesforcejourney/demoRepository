import { LightningElement } from "lwc";

export default class HelloWorld extends LightningElement {
  @track  = "We are in refresher session";
  welcomeMessage = "";

  changeHandler(event) {
    this.welcomeMessage = event.target.value;
  }
}
