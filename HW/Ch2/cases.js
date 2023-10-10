const permutation = (n,r) => {
    return n/(n-r);
}

const combination = (n,r) => {
    return permutation(n.r) / r;
}

const multiPermutation = (n,r) => {
    return n**r;
}

const multiCombination = (n,r) => {
    return combination(n+r-1,r);
}


modules.export*{
    permutation,
    combination,
    multiPermutation,
    multiCombination,
};