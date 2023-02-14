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
    
    likeButton.addEventListener('click', () => {
      
      event.preventDefault()
      
      likeButton.classList.toggle('text-primary')
      likeButton.parentElement.nextElementSibling.classList.toggle('text-primary')
      
      let data = new FormData(likeButton.parentElement)
      
      if (likeButton.classList.contains('text-primary')) {
        
        Rails.ajax({
          url: '/posts/' + this.data.get('post-id') + '/likes',
          type: 'POST',
          data: data,
          success: function(data) {
            document.getElementById('show_post_header').setAttribute('data-like-unlike-like-id', data.like_id)
            let likeNum = likeButton.parentElement.nextElementSibling.textContent
            likeButton.parentElement.nextElementSibling.textContent = '' + (parseInt(likeNum) + 1)
          }
        })
        
      } else {
        
        Rails.ajax({
          url: '/posts/' + this.data.get('post-id') + '/likes/' + this.data.get('like-id'),
          type: 'DELETE',
          data: data,
          success: function(data) {
            let likeNum = likeButton.parentElement.nextElementSibling.textContent
            likeButton.parentElement.nextElementSibling.textContent = '' + (parseInt(likeNum) - 1)
          }
        })
      }
    })
  }
}
