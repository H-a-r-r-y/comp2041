function species_count(target_species, whale_list) {

  // PUT YOUR CODE HERE
    var sum = 0;
    for(i of whale_list){
        if(i.species == target_species){
            sum += i.how_many;
        }
    }
    return sum;
}

module.exports = species_count;
