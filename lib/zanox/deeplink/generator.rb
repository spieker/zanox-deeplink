module Zanox
  module Deeplink
    class Generator
      def initialize
        @browser = Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
        }
      end

      def login(username, password)
        login = @browser.get('https://auth.zanox.com/connect/login')
        form = login.form_with(action: '/connect/login?')
        form['loginForm.userName'] = username
        form['loginForm.password'] = password
        @browser.agent.http.tap { |http|
          uri = URI('https://auth.zanox.com/connect/login')
          http.reset http.connection_for(uri)
        }
        page = form.submit
        unless page.code.starts_with? '2'
          fail StandardError.new
        end
      end

      def deeplink(url, options = {})
        tool = @browser.get('https://toolbox.zanox.com/deeplink/')
        form = tool.form_with(name: 'deeplinks')
        form['zanox_adspaces'] = options[:adspace] if options[:adspace]
        form['url'] = url
        sleep 5
        page = form.submit
        unless page.code.starts_with? '2'
          fail StandardError.new
        end
        page.link_with(text: 'Test').try :href
      end
    end
  end
end
