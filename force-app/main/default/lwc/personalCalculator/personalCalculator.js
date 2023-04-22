import { LightningElement } from "lwc";

export default class PersonalCalculator extends LightningElement {
  number1;
  number2;

  changeHandler(event) {
    let eventname = event.target.name;
    let eventvalue = event.target.value;
    if (eventname === "number1") this.number1 = eventvalue;
    if (eventname === "number2") this.number2 = eventvalue;
  }
  clickHandler(event) {
    let eventlabel = event.target.label;

    let intnumber1 = parseInt(this.number1);
    let intnumber2 = parseInt(this.number2);

    if (eventlabel === "Add") {
      alert(intnumber1 + intnumber2);
    } else if (eventlabel === "Sub") {
      alert(intnumber1 - intnumber2);
    } else if (eventlabel === "Mul") {
      alert(intnumber1 * intnumber2);
    } else if (eventlabel === "Div") {
      alert(intnumber1 / intnumber2);
    }
  }
}
