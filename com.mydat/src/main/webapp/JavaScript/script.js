

function add_to_cart(pid,pname,price) {
	let cart=localStorage.getItem("cart");
	if(cart==null)
		{
		
		let products=[];
		let product={ productId:pid,
				      productName:pname,
				      productQuantity:1,
				      productPrise:price
		};
			products.push(product);
			localStorage.setItem("cart",JSON.stringify(products));
			showToast("item is added to a cart")
		
		console.log("product is added first time")
		}else
			{
			   let pcart=JSON.parse(cart);
			   let oldProduct=pcart.find((item)=> item.productId==pid);
			   
			   if(oldProduct)
				   {
				   oldProduct.productQuantity=oldProduct.productQuantity+1
				   pcart.map((item)=>
				   {
					   if(item.productId==oldProduct.productId)
						   {
						   item.productQuantity=oldProduct.productQuantity;
						   }
				   })
				   
				   localStorage.setItem("cart",JSON.stringify(pcart));
				   console.log("product quantity is increse")
				   showToast(oldProduct.productName +"product quantity is increased")
				   }
			   else
				   {
				   let product={ productId:pid,
						      productName:pname,
						      productQuantity:1,
						      productPrise:price
				};
				   pcart.push(product);
				   localStorage.setItem("cart",JSON.stringify(pcart));
				   console.log("product is added ")
					showToast("product is added to a cart")

				   }
			   }
	updateCart();
}

function updateCart()
{
  let cartstring=localStorage.getItem("cart");
  let cart=JSON.parse(cartstring);
  if(cart==null || cart.lenght==0)
	  {
	  console.log("cart is empty!!")
	  $(".cart-items").html("( 0 )");
	  $(".cart-body").html("<h3>Cart does not have any items</h3>");
	  $(".checkout-btn").attr("disabled",true);
	  }
  else
	  {
	  //there is somthing
	  console.log(cart)
	  $(".cart-items").html(`( ${cart.length} )`);
	  
	  let table=`
	       <table class="table">
	       <thead class="thread-;light">
	       <tr>
	       <th>Item Name</th>
	        <th>Prise</th>
	         <th>Quantity</th>
	          <th>Total Price</th>
	           <th>Action</th>
	       
	       </tr>
	    </thead>
	  `;
	   
	  let totalPrise=0;	
	  cart.map((item)=>{
		  table+=`
			  <tr>
		          <td> ${item. productName} </td>
		          <td> ${item. productPrise} </td>
		          <td> ${item. productQuantity} </td>
		          <td> ${item. productQuantity*item. productPrise} </td>
		           <td><button onclick="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm">Remove</button></td>
		   
		      </tr>
		  `
			  totalPrise +=item. productQuantity*item. productPrise;
	  })
	  
	  table=table+ `
	  <tr>
	      <td colspan="5" class="text-right font-weight-bold m-5"> Total Price: ${totalPrise}</td>
	  </tr>
	  
	  </table>`
	  $(".cart-body").html(table);
	  $(".checkout-btn").attr("disable",false);
	  }
}

function  deleteItemFromCart(pid)
{
  let cart=JSON.parse(localStorage.getItem("cart"));
  let newcart=cart.filter((item)=>item.productId !=pid);
  localStorage.setItem("cart",JSON.stringify(newcart));
  updateCart();
  showToast("product is remove to a cart")
}

$(document).ready(function ()
		{
	updateCart();
		})

		
function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>
	{
		$("toast").removeClass("display");
	}, 2000);
	
}


function goToCheckout(){
	window.location="checkout.jsp"
}


let c=document.getElementsByClassName("card-title");
c.style.color="red"