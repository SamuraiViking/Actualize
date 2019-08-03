var app = new Vue({
  el: "#app",
  data: {
    message: "Hello Vue!",
    circleTurn: true,
    marks: {
      1: null, 2: null, 3: null,
      4: null, 5: null, 6: null,
      7: null, 8: null, 9: null
    },
  },
  methods: {
    toggle: function(idx) {
      var symbol = '';
      if (this.circleTurn) {
        symbol = 'o';
      } else {
        symbol = 'x';
      }
      this.marks[idx] = symbol;
      this.circleTurn = !this.circleTurn;
      this.checkWin(symbol);
    }, 
    reset: function() {
      console.log("reset");
      for (var i = 1; i < 9; i++) {
        this.marks[i] = i;
      }
    },
    checkWin: function(symbol) {
      var streak = 0;
      for (var i = 1; i < 9; i++) {
        if (this.marks[i] === symbol) {
          streak += 1;
          if (streak === 3) {
            break;
          }
        } else {
          streak = 0;
        }
      }
      console.log(streak);
      if (streak === 3) {
        console.log("you win!");
      }
    }
  }
});
