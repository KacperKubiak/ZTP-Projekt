defmodule AuthServer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :clientId, :string
      add :token, :string
      add :name, :string
      add :secret, :string
      add :exp, :integer
      add :-, :string
      add :"no-context", :string
      add :-, :string
      add :"no-schema", :string

      timestamps()
    end
  end
end
