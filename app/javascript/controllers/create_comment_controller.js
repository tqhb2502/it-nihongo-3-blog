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
  
  connect() {
    
    document.querySelector('.create-comment-btn').addEventListener('click', () => {
      
      event.preventDefault()
      
      let data = new FormData(document.querySelector('.create-comment-form'))
      
      Rails.ajax({
        url: '/posts/' + this.data.get('post-id') + '/comments',
        type: 'POST',
        data: data
      })
    })
  }
}
