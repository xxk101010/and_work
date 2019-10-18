function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

J                     =  mean(-1*y.*log(sigmoid(X*theta)) - (1 - y).*log(1 - sigmoid(X*theta))) + 0.5*lambda*sum(theta.^2)./m;

grad(1)               =  mean((sigmoid(X*theta) - y).*X(:,1));

grad(2:size(theta))   =  mean(repmat((sigmoid(X*theta) - y), 1, length(theta) - 1).*X(:,2:size(theta))).'  + lambda*theta(2:size(theta))./m;
% =============================================================

end
