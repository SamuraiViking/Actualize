<template>
  <div class="home">
    <h1>{{ message }}</h1>

    <!-- create product -->
    <div>
      <button v-on:click="makeProduct()"> Make a new product </button>

      <p>Name: <input type="text" v-model="newProductName"></p>
      <p>Price: <input type="text" v-model="newProductPrice"></p>
      <p>Description: <input type="text" v-model="newProductDescription"></p>
      <p>Supplier: <input type="text" v-model="newProductSupplier"></p>
    </div>
    <hr>

    <!-- loop through products -->
    <div v-for="product in products">

      <!-- show product -->
      <div class="product">
        <div>
          <p> {{ product.name }} ${{ product.price }} </p>
          <img v-bind:src="product.image_url" alt="image not found">
          <!-- more info button -->
          <div>
            <button v-on:click="setProduct(product)">Show more info</button>
          </div>
        </div>

        <!-- more product info -->
        <div v-if="currentProduct === product" class="more-info">
          <!-- more info -->
          <div class="product-more-info">
            <h3>Description</h3>
            <p>{{ product.description }}</p>
            <h3>Supplier</h3>
            <p>{{ product.supplier_name }}</p>
          </div>
          <!-- Update Product -->
          <div class="product-update">
            <p>Name: <input type="text" v-model="product.name"></p>
            <p>Price: <input type="text" v-model="product.price"></p>
            <p>Description: <input type="text" v-model="product.description"></p>
            <p>Supplier: <input type="text" v-model="product.supplier_id"></p>

            <button v-on:click="updateProduct(product)">update product</button>          
          </div>

        </div>
      </div>
      <hr>
      <button v-on:click="destroyProduct(product)">Destroy</button>
      <hr>
    </div>
  </div>
</template>

<style>
</style>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [],
      newProductName: '',
      newProductPrice: '',
      newProductDescription: '',
      newProductSupplier: '',
      currentProduct: ''
    };
  },
  created: function() {
    console.log("I am created");
    axios.get("api/products").then(response => {
      console.log(response.data);
      this.products = response.data;
    });
  },
  methods: {
    makeProduct: function() {
      var newProduct = {
        name: this.newProductName,
        price: this.newProductPrice,
        description: this.newProductDescription,
        supplier_id: 1
      };
      axios.post('api/products',newProduct).then (response => {
        console.log(response.data);
        this.products.push(response.data);
      });
    },
    updateProduct: function(product) {
      axios.patch('api/products/' + product.id, product).then (response => {
        this.products.push(response.data);
      });
      console.log(product);
    },
    setProduct: function(product) {
      if (this.currentProduct === product) {
        this.currentProduct = '';
      } else {
        this.currentProduct = product;
      }
    },
    destroyProduct: function(product) {
      axios.delete('/api/products/' + product.id).then(response => {
        console.log(index);
        var index = this.products.indexOf(product);
        this.product.slice(index, 1);
      });
    }
  }
};
</script>