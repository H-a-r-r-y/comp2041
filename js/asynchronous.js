//setTimeout put the callback func into task queue which will be executed later
console.log("1")
setTimeout(()=>{console.log("2")},0);
console.log("3")

// 
function callback(){console.log("6")}
function fn(callback){
    console.log("4")
    callback();
    console.log("5")
}
fn(callback)
