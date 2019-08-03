var app = new Vue({
  el: "#app",
  data: {
    message: "message",
    showMessage: true
  },
  methods: {
    toggleMessage: function() {
      this.showMessage = !this.showMessage;
    }
  }
});