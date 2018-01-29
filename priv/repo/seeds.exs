# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TigerhoodApi.Repo.insert!(%TigerhoodApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TigerhoodApi.{Tigers.Tiger, Messages.Message, Repo}

# We are deleting the data here !!!!!!!>!!<!>!<><>!<
Repo.all(Tiger)
|> Enum.each(fn x -> Repo.delete(x) end)

dani_seed = %{ name: "Daniel Antoniazzi Amarante", image: "https://avatars2.githubusercontent.com/u/7462237?s=200&v=4", messages: []}
heck_seed = %{ name: "Fernando Sehnem Heck", image: "https://avatars1.githubusercontent.com/u/3910722?s=200&v=4", messages: []}
matth_seed = %{ name: "Matthias Oliveira de Nunes", image: "https://avatars2.githubusercontent.com/u/6979113?s=200&v=4", messages: []}

message = %{tiger_id: 1, author: "Bei bie", content: "hhauhahuauha"}

%Tiger{}
    |> Tiger.changeset(dani_seed)
    |> Repo.insert!()

%Tiger{}
    |> Tiger.changeset(heck_seed)
    |> Repo.insert!()

%Tiger{}
    |> Tiger.changeset(matth_seed)
    |> Repo.insert!()

%Message{}
    |> Message.changeset(message)
    |> Repo.insert!()