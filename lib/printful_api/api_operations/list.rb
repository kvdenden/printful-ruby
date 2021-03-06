module PrintfulAPI

	module APIOperations

		module List

			def self.included(base)
				base.extend(ClassMethods)
			end

			module ClassMethods

				def list( filters={}, opts={} )

					data_list = PrintfulAPI.request( :GET, opts.delete(:resource_path) || self.resource_path, params: filters )

					data_list.collect do |data|

						model = self.new
						model.load_data( data )

						model

					end
				end

				alias :all :list

			end

		end

	end

end
