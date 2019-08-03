<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>first name: <input type="text" v-model="newFirstName"></p>
    <p>last name: <input type="text" v-model="newLastName"></p>
    <p>email: <input type="text" v-model="newEmail"></p>

    <button v-on:click="addContact">add contact</button>

    <div v-for="contact in contacts">
      <hr>
      <p>first name: {{ contact.first_name }} </p>
      <p>last name: {{ contact.last_name }} </p>
      <p>email: {{ contact.email }} </p>

      <p>first name: <input type="text" v-model="contact.first_name"></p>
      <p>last name: <input type="text" v-model="contact.last_name"></p>
      <p>email: <input type="text" v-model="contact.email"></p>

      <button v-on:click="updateContact(contact)">update contact</button>
      <button v-on:click="destroyContact(contact)">delete contact</button>
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
      message: "Contacts",
      contacts: [],
      newFirstName: '',
      newLastName: '',
      newEmail: ''
    };
  },
  created: function() {
    axios.get('/api/contacts').then(response => {
      console.log(response.data);
      this.contacts = response.data;
    });
  },
  methods: {

    addContact: function() {
      var newContact = {
        first_name: this.newFirstName,
        last_name: this.newLastName,
        email: this.newEmail
      };
      axios.post('/api/contacts', newContact).then(response => {
        console.log(response.data);
        this.contacts.push(response.data);
      });
    },
    updateContact: function(theContact) {
      axios.patch('/api/contacts/' + theContact.id, theContact).then(response => {
        console.log(response.data);

        theContact.first_name = response.data.first_name;
        theContact.last_name = response.data.last_name;
        theContact.email = response.data.email;
      });
    },
    destroyContact: function(theContact) {
      axios.delete('/api/contacts/' + theContact.id).then(response => {
        console.log(response.data);

        var index = this.contacts.indexOf(theContact);
        this.contacts.splice(index, 1);
      });
    }
  }
};
</script>