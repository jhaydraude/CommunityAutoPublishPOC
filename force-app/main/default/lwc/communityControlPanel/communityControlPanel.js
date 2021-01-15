import { LightningElement, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getAllCommunities from '@salesforce/apex/ControlPanelController.getAllCommunities';
import activateCommunity from '@salesforce/apex/ControlPanelController.activateCommunity';
import publishCommunity from '@salesforce/apex/ControlPanelController.publishCommunity';


export default class CommunityControlPanel extends LightningElement {
  @wire(getAllCommunities) communitiesWired;

  apiResult;

  get communities() {
    return this.communitiesWired.data;
  }

  get prettyError() {
    return JSON.stringify(this.communitiesWired);
  }

  handleActivate(event) {
    activateCommunity({ CommunityID: event.target.dataset.id })
    .then((result) => {
        this.apiResult = result;
        refreshApex(this.communitiesWired);
    })
    .catch((error) => {
        this.apiResult = error;
       
    });
}

handlePublish(event) {
  publishCommunity({ CommunityID: event.target.dataset.id })
  .then((result) => {
      this.apiResult = result;
  })
  .catch((error) => {
      this.apiResult = error;
     
  });
}
  

}