function y = storage(p1,p2,p3)
    w1 = whos('p1');
    w2 = whos('p2');
    w3 = whos('p3');
    y = (1/8)*(w1.bytes + w2.bytes + w3.bytes);
end