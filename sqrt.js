const sqrt = x => {
    const goodEnough = guess => (Math.abs(guess**2 - x)) < 0.0000000000001;
    const improveGuess = guess => (guess + (x / guess)) * 0.5;
    const sqrtIter = guess => goodEnough(guess) ? guess : sqrtIter(improveGuess(guess)) 

    return sqrtIter(1.0);
}

console.log(sqrt(2))