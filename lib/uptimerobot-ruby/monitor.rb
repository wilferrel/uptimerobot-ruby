module UptimeRobot
  class Monitor
    def initialize(params)
      @id = params[:id]
      @name = params[:name]
      @url = params[:url]
      @monitors= params[:monitors]
    end

    def self.create(params)
      response = post params
      new(params.merge(:id => response["monitor"]["id"]))
    end

    def self.post(params)
      UptimeRobot::Client.request("/newMonitor", params)
    end
    def self.getMonitors(params)
      UptimeRobot::Client.request("/getMonitors", params)
    end
  end
end
