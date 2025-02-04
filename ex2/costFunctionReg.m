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

% X has dimension (m, n+1) and theta (n+1, 1) and y (m, 1)
z = X * theta;  % z has dimension (m, 1), same as y and hypothesis
hypothesis = sigmoid(z);
theta1 = theta(2:size(theta, 1));
J = (-1/m) * (y' * log(hypothesis) + (1 - y)' * log(1 - hypothesis)) + lambda / (2*m) * (theta1' * theta1);

% grad has same dimension as theta (n+1, 1)
grad(1, 1) = (1/m) * X(:, 1)' * (hypothesis - y);
for j = 2:size(theta, 1),
  grad(j, 1) = (1/m) * X(:, j)' * (hypothesis - y) + (lambda/m) * theta(j, 1);
end





% =============================================================

end
