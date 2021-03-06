classdef ChooseObjectResponse < ros.Message
    %ChooseObjectResponse MATLAB implementation of visp_common/ChooseObjectResponse
    %   This class was automatically generated by
    %   ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2020 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'visp_common/ChooseObjectResponse' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '386cb9bbae47792079e99f447716d15f' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        GeometryMsgsPointClass = ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Point') % Dispatch to MATLAB class for message type geometry_msgs/Point
    end
    
    properties (Dependent)
        ObjectCenter
        Success
    end
    
    properties (Access = protected)
        Cache = struct('ObjectCenter', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'ObjectCenter', 'Success'} % List of non-constant message properties
        ROSPropertyList = {'object_center', 'success'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = ChooseObjectResponse(msg)
            %ChooseObjectResponse Construct the message object ChooseObjectResponse
            import com.mathworks.toolbox.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('ros:mlros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('ros:mlros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('ros:mlros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function objectcenter = get.ObjectCenter(obj)
            %get.ObjectCenter Get the value for property ObjectCenter
            if isempty(obj.Cache.ObjectCenter)
                obj.Cache.ObjectCenter = feval(obj.GeometryMsgsPointClass, obj.JavaMessage.getObjectCenter);
            end
            objectcenter = obj.Cache.ObjectCenter;
        end
        
        function set.ObjectCenter(obj, objectcenter)
            %set.ObjectCenter Set the value for property ObjectCenter
            validateattributes(objectcenter, {obj.GeometryMsgsPointClass}, {'nonempty', 'scalar'}, 'ChooseObjectResponse', 'ObjectCenter');
            
            obj.JavaMessage.setObjectCenter(objectcenter.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.ObjectCenter)
                obj.Cache.ObjectCenter.setJavaObject(objectcenter.getJavaObject);
            end
        end
        
        function success = get.Success(obj)
            %get.Success Get the value for property Success
            success = logical(obj.JavaMessage.getSuccess);
        end
        
        function set.Success(obj, success)
            %set.Success Set the value for property Success
            validateattributes(success, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'ChooseObjectResponse', 'Success');
            
            obj.JavaMessage.setSuccess(success);
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.ObjectCenter = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.Success = obj.Success;
            
            % Recursively copy compound properties
            cpObj.ObjectCenter = copy(obj.ObjectCenter);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Success = strObj.Success;
            obj.ObjectCenter = feval([obj.GeometryMsgsPointClass '.loadobj'], strObj.ObjectCenter);
        end
    end
    
    methods (Access = ?ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Success = obj.Success;
            strObj.ObjectCenter = saveobj(obj.ObjectCenter);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.custom.msggen.visp_common.ChooseObjectResponse.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = ros.custom.msggen.visp_common.ChooseObjectResponse;
            obj.reload(strObj);
        end
    end
end
