module Api
  module V1
    class ContainersController < ApplicationController
      before_action :set_container, only: %i[ show update destroy items]

      def index
        @containers = Container.all
        render json: @containers
      end

      def show
        url_to_encode = request.base_url + api_v1_container_show_path
        base64 = qr_as_base64(url_to_encode)

        response = {
          id: @container.id,
          description: @container.description,
          QRCode: base64
        }

        render json: response
      end

      def create
        @container = Container.new(container_params)

        if @container.save
          render json: @container, status: :created, location: @container
        else
          render json: @container.errors, status: :unprocessable_entity
        end
      end
      
      def update
        if @container.update(container_params)
          render json: @container
        else
          render json: @container.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @container.destroy
      end

      def items
        render json: @container.items
      end

      private
      def set_container
        @container = Container.find(params[:id])
      end

      def container_params
        params.require(:container).permit(:description)
      end

    end
  end
end
