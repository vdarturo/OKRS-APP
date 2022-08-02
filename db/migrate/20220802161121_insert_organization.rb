class InsertOrganization < ActiveRecord::Migration[7.0]
  def change
    Organization.create(name: "CodigoFacilito", mision: "Somos una plataforma de educación", vision: "Seremos un ecosistema educativo")
  end
end
