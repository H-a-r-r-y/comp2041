function total_bill(bill_list) {
    var total = 0;
    for(const i of bill_list){
        for(const k of i){
            total += parseFloat(k.price.slice(1))
        }
    }
    return total;
}

module.exports = total_bill;
