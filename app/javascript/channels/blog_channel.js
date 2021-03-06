import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
	
	const blog_element = document.getElementById('blog-id')
	const blog_id = Number(blog_element.getAttribute('data-blog-id')) 
	const btn_post = document.getElementById("post-comment")
	const txt_comment = document.getElementById("comment")
	console.log(consumer.subscriptions)

	consumer.subscriptions.create({channel: "BlogChannel", blog_id: blog_id }, {
	  connected() {
	    console.log("connected to BlogChannel " + blog_id)
	  },

	  disconnected() {
	    // Called when the subscription has been terminated by the server
	  },

	  received(data) {

	    const commentContainer = document.getElementById("comments")
	    commentContainer.innerHTML = commentContainer.innerHTML + data.html
	    
	    txt_comment.value = ''
	    btn_post.disabled = false
	  }
	});
})
 