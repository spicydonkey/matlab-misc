function c = nCk(n,k)
%NCHOOSEK Binomial coefficient or all combinations.
%   NCK(N,K) where N and K are non-negative integers returns N!/K!(N-K)!.
%   This is the number of combinations of N things taken K at a time.
%   When a coefficient is large, a warning will be produced indicating
%   possible inexact results. In such cases, the result is only accurate
%   to 15 digits for double-precision inputs, or 8 digits for single-precision
%   inputs.
%
%   Class support for inputs N,K:
%      float: double, single
%      integer: uint8, int8, uint16, int16, uint32, int32, uint64, int64
%
%   Class support for inputs V:
%      float: double, single
%      integer: uint8, int8, uint16, int16, uint32, int32, uint64, int64
%      logical, char
%
%   See also PERMS.

%   Copyright 1984-2013 The MathWorks, Inc.
%   Modified DKS (see lines with `DKS`)

if ~isscalar(k) || k < 0 || ~isreal(k) || k ~= round(k)
    error(message('nCk:InvalidArg2'));
end

% the first argument is a scalar integer
if isscalar(n) && isnumeric(n) && isreal(n) && n==round(n) && n >= 0
    % if the first argument is a scalar, then, we only return the number of
    % combinations. Not the actual combinations.
    % We use the Pascal triangle method. No overflow involved. c will be
    % the biggest number computed in the entire routine.
    %
    if isinteger(n)
        if ~(strcmp(class(n),class(k)) || isa(k,'double'))
            error(message('MATLAB:nchoosek:mixedIntegerTypes'))
        end
        classOut = class(n);
        inttype = true;
        int64type = isa(n,'int64') || isa(n,'uint64');
    elseif isinteger(k)
        if ~isa(n,'double')
            error(message('MATLAB:nchoosek:mixedIntegerTypes'))
        end
        classOut = class(k);
        inttype = true;
        int64type = isa(k,'int64') || isa(k,'uint64');
    else % floating point types
        classOut = superiorfloat(n,k);
        inttype = false;
        int64type = false;
    end
    
    if k > n
        % DKS:  return 0
%         error(message('MATLAB:nchoosek:KOutOfRange'));    % matlab default
        c=0;
        return
    elseif ~int64type && n > flintmax
        error(message('MATLAB:nchoosek:NOutOfRange'));
    end
    
    if k > n/2   % use smaller k if available
        k = n-k;
    end
    
    if k <= 1
        c = n^k;
    else
        if int64type
            % For 64-bit integers, use an algorithm that avoids
            % converting to doubles
            c = binCoef(n,k,classOut);
        else
            % Do the computation in doubles.
            nd = double(n);
            kd = double(k);
            
            nums = (nd-kd+1):nd;
            dens = 1:kd;
            nums = nums./dens;
            c = round(prod(nums));
            
            if ~inttype && c > flintmax(classOut)
                warning(message('MATLAB:nchoosek:LargeCoefficient', ...
                    sprintf( '%e', flintmax(classOut) ), floor(log10(flintmax(classOut)))));
            end
            % Convert answer back to the correct type
            c = cast(c,classOut);
        end
    end
    
else
    % the first argument is a vector, generate actual combinations.
    
    n = length(n);
    if iscolumn(n)
        n = n.';
    end
    
    if n == k
        c = n;
    elseif n == k + 1
        c = repmat(n,n,1);
        c(1:n+1:n*n) = [];
        c = reshape(c,n,k);
    elseif k == 1
        c = n.';
    elseif k == 0
        c = zeros(1,0,class(n));
    elseif n < 17 && (k > 3 || n-k < 4)
        tmp = uint16(2^n-1):-1:2;
        x = bsxfun(@bitget,tmp.',n:-1:1);
        
        idx = x(sum(x,2) == k,:);
        nrows = size(idx,1);
        [rows,~] = find(idx');
        c = reshape(n(rows),k,nrows).';
    else
        [~,maxsize] = computer;
        % Error if output dimensions are too large
        if k*nchoosek(n,k) > maxsize
            error(message('MATLAB:pmaxsize'))
        end
        c = combs(n,k);
    end
end

end

%----------------------------------------
function c = binCoef(n,k,classOut)
% For integers, compute N!/((N-K)! K!) using prime factor cancellations

numerator = cast((n-k+1):n,classOut);
for denominator = k:-1:1
    F = factor(denominator);
    for whichfactor = 1:numel(F)
        thefactor = F(whichfactor);
        largestMultiple = find(mod(numerator,thefactor) == 0, 1, 'last');
        numerator(largestMultiple) = numerator(largestMultiple)/thefactor;
    end
end
c = prod(numerator,'native');
end

%----------------------------------------
function P = combs(n,m)
%COMBS  All possible combinations.
%   COMBS(1:N,M) or COMBS(V,M) where V is a row vector of length N,
%   creates a matrix with N!/((N-M)! M!) rows and M columns containing
%   all possible combinations of N elements taken M at a time.
%
%   This function is only practical for situations where M is less
%   than about 15.

n = n(:).'; % Make sure n is a row vector.
n = length(n);
if n == m
    P = n;
elseif m == 1
    P = n.';
else
    P = [];
    if m < n && m > 1
        for k = 1:n-m+1
            Q = combs(n(k+1:n),m-1);
            P = [P; [n(ones(size(Q,1),1),k) Q]]; %#ok
        end
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
