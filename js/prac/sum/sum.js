function sum(list) {
    var s = 0;
    for(const i of list){
        s += parseInt(i);
    }
    return s;
}

module.exports = sum;
