
function sum(nums) {
  var result = 0;
  nums.forEach(function(num) {
    result += num;
  });
  return result;
}

function product(nums) {
  var result = 1;
  nums.forEach(function(num) {
    result *= num;
  });
  return result;
}

var app = new Vue({
  el: "#app",
  data: {
    num1: 0,
    num2: 0,
    num3: 0,
    result: "",
    message: "message",
    showMessage: true
  },
  methods: {
    nums: function() {
      return [Number(this.num1), Number(this.num2), Number(this.num3)];
    }, 
    computeSum: function() {
      this.result = sum(this.nums());
    },
    computeProduct: function() {
      this.result = product(this.nums());
    }
  }
});