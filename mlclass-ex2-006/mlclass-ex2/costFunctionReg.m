function [J, grad] = costFunctionReg(theta, X, y, lambda)
% COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
% J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
% theta as the parameter for regularized logistic regression and the
% gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


t = theta .^ 2;
J = costFunction(theta, X, y) + (lambda / (2*m)) * (sum(t) - t(1));

%%%
h = sigmoid (X*theta)

grad(1) = (1/m) * sum((h - y) .* X(:, 1))

i = 2;
while i <= size(grad,1);
    grad(i) = (1/m) * sum((h - y) .* X(:, i)) + (lambda / m) * theta(i);
    i = i+1;
end;


% =============================================================

end
