import { LightningElement } from "lwc";

export default class LoopingLwc extends LightningElement {
  car = ["Audi", "BMW", "Maruti", "Honda"];

  contacts = [
    {
      id: 1,
      name: "Ankit",
      role: "trainer"
    },
    {
      id: 2,
      name: "Raju",
      role: "Particpant"
    },
    {
      id: 3,
      name: "Tejashree",
      role: "coordinator"
    }
  ];
}
