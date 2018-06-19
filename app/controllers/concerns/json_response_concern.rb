module JsonResponseConcern
  extend ActiveSupport::Concern

  included do
    private

    def json_success_response(partial=nil, locals=nil, opts={}, resp_opts={need_flash: true})
      if block_given?
        yield
      else
        { html: render_to_string(partial: partial,
                                 locals: locals,
                                 formats: [:html]) }.merge!(opts)
      end.tap do |response|
        if resp_opts[:need_flash]
          response[:flash] = json_success_flash
          # Discard flash messages or they will be displayed again once the page is refreshed or location changed
          flash.discard
        end
      end
    end

    def json_failure_response(partial=nil, locals=nil, resource=nil, opts={}, resp_opts={need_flash: true})
      if block_given?
        yield
      else
        { html: render_to_string(partial: partial,
                                 locals: locals,
                                 formats: [:html]) }.merge!(opts)
      end.tap do |response|
        if resp_opts[:need_flash]
          response[:flash] = json_failure_flash
          response[:errors] = resource.errors.full_messages if resource.present?
          # Discard flash messages or they will be displayed again once the page is refreshed or location changed
          flash.discard
        end
      end
    end

    def json_success_flash
      return flash.to_hash if flash.present?
      return { notice: I18n.t("flash.default.success") }
    end

    def json_failure_flash
      return flash.to_hash if flash.present?
      return { alert: I18n.t("flash.default.error") }
    end

  end
end
