var app = new Vue({
  el: "#app",
  data: {
    guess: 0,
    answer: Math.floor(Math.random() * (10 - 1)) + 1,
    message: "hello"
  },
  methods: {
    makeGuess: function() {
      var guess = Number(this.guess);
      if (guess < this.answer) {
        this.message = "too low";
      } else if (guess > this.answer) {
        this.message = "too high";
      } else {
        this.message = "YOU WIN!";
      }
    }
  }
});