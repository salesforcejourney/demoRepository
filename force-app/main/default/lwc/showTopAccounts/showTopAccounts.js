import { LightningElement, wire } from "lwc";
import getTopAccounts from "@salesforce/apex/accountHelper.getTopAccounts";
const columns = [
  { label: "Name", fieldName: "Name" },
  { label: "Industry", fieldName: "Industry" }
];
export default class ShowTopAccounts extends LightningElement {
  accindustry = "";
  columns = columns;
  @wire(getTopAccounts, {
    industry: "$accindustry"
  })
  accounts;
}
