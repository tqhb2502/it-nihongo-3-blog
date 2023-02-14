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
      
    let likeButton = document.querySelector('.like-btn')
    console.log(likeButton)
    
    likeButton.addEventListener('click', () => {
      
      likeButton.classList.toggle('text-primary')
      likeButton.nextElementSibling.classList.toggle('text-primary')
      
      // if (likeButton.classList.contains('text-primary')) {
      //   Rails.ajax({
      //     url: '/posts/' + this.data.get('post-id') + '/likes',
      //     type: 'POST',
      //     // data: 
      //   })
      // }
    })
  }
}
