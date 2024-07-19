class ApplicationController < ActionController::API
  private
  def intesrsect_bfs(graph, start_node, target_node, start_node2, target_node2)
    visited = []
    queue = []
    queue.push(start_node)
    visited.push(start_node)
    while !queue.empty?
      current_node = queue.shift
      if current_node == target_node
        break
      end
      if !graph[current_node].nil?
        graph[current_node].each do |node|
          if !visited.include?(node)
            queue.push(node)
            visited.push(node)
          end
        end
      end  
    end

    if visited.include?(target_node2)
      return true
    end
    if visited.include?(start_node2)
      return true 
    end
    return false
  end

  def valid_path_bfs(graph, start_node, target_node)
    visited = []
    queue = []
    queue.push(start_node)
    visited.push(start_node)
    while !queue.empty?
      current_node = queue.shift
      if current_node == target_node
        return true
      end
      if !graph[current_node].nil?
        graph[current_node].each do |node|
          if !visited.include?(node)
            queue.push(node)
            visited.push(node)
          end
        end
      end
    end
    return false
  end
  


  def authenticate
    token = request.headers["Authorization"]
    if token.nil?
      render json: { errors: ["Unauthorized"] }, status: 401
      return  
    end
    begin
      token = token.split(" ").last
      AuthenticationTokenService.user_from_token(token)
    rescue
      render json: { errors: ["Unauthorized"] }, status: 401
    end
  end

end
