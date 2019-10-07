
function sum(list) {

  // PUT YOUR CODE HERE
    var sum = 0; 
    for(i of list){
        sum += parseInt(i);
    }
    return sum;
}

module.exports = sum;
