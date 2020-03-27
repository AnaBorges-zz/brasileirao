//
//  MockJson.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/19/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

enum MockJson{

    static func loginJson() -> Data {
    
        """
        {
            "token": "jfgsk-hjfdjkjds-hjfdj38bjndfj-mbfd3"
        }
        """.data(using: .utf8)!
    }
    
    static func jogosJson() -> Data{
        """
        [{
            "id": 1,
            "data": "2019-04-27T16:00:00.000Z",
            "local": "Morumbi",
            "timeCasa": {
                    "nome": "São Paulo",
                    "sigla": "SPFC",
                    "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                    "gols": 2
                },
            "timeVisitante": {
                    "nome": "Botafogo",
                    "sigla": "BOT",
                    "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2019/02/04/botafogo-65.png",
                    "gols": 0
                
                }
        },
        {
            "id": 2,
            "data": "2019-04-28T19:00:00.000Z",
            "local": "Independência",
            "timeCasa": {
                    "nome": "Atlético-MG",
                    "sigla": "CAM",
                    "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2017/11/23/Atletico-Mineiro-escudo65px.png",
                    "gols": 2
                },
            "timeVisitante": {
                    "nome": "Avaí",
                    "sigla": "Avaí",
                    "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/09/04/escudo-avai-65x65.png",
                    "gols": 1
                }
        },
        {
            "id": 1,
            "data": "2019-04-28T21:00:00.000Z",
            "local": "Arena Condá",
            "timeCasa": {
                    "nome": "Chapecoense",
                    "sigla": "ACF",
                    "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2015/08/03/Escudo-Chape-165.png",
                    "gols": 2
                },
            "timeVisitante": {
                    "nome": "Internacional",
                    "sigla": "SCI",
                    "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2016/05/03/inter65.png",
                    "gols": 0
                }
        }]
        """.data(using: .utf8)!
    }
    
    static func fichaJogoSelecionado() -> Data{
    """
        {
            "timeCasa": {
                "tecnico": "Cuca",
                "esquema": "4-3-3",
                "jogadores": [{
                    "nome": "Tiago Volpi",
                    "camisa": 23,
                    "posicao": "GOL"
                },
                {
                    "nome": "Igor Vinícius",
                    "camisa": 2,
                    "posicao": "LAD"
                },
                {
                    "nome": "Arboleda",
                    "camisa": 5,
                    "posicao": "ZAD"
                },
                {
                    "nome": "Bruno Alves",
                    "camisa": 3,
                    "posicao": "ZAE"
                },
                {
                    "nome": "Reinaldo",
                    "camisa": 6,
                    "posicao": "LAE"
                },
                {
                    "nome": "Hudson",
                    "camisa": 25,
                    "posicao": "VOL"
                },
                {
                    "nome": "Tchê Tchê",
                    "camisa": 28,
                    "posicao": "VOL"
                },
                {
                    "nome": "Igor Gomes",
                    "camisa": 26,
                    "posicao": "MEC"
                },
                {
                    "nome": "Antony",
                    "camisa": 39,
                    "posicao": "ATA"
                },
                {
                    "nome": "Alexandre Pato",
                    "camisa": 7,
                    "posicao": "ATA"
                },
                {
                    "nome": "Everton",
                    "camisa": 2,
                    "posicao": "ATA"
                }],
                "reservas": [{
                    "nome": "Vitor Bueno",
                    "camisa": 12,
                    "posicao": "MEC"
                },
                {
                    "nome": "Hernanes",
                    "camisa": 15,
                    "posicao": "VOL"
                },
                {
                    "nome": "Toró",
                    "camisa": 44,
                    "posicao": "ATA"
                },
                {
                    "nome": "Jean",
                    "camisa": 1,
                    "posicao": "GOL"
                },
                {
                    "nome": "Anderson Martins",
                    "camisa": 4,
                    "posicao": "ZAE"
                },
                {
                    "nome": "Léo",
                    "camisa": 16,
                    "posicao": "LAE"
                },
                {
                    "nome": "Jucilei",
                    "camisa": 8,
                    "posicao": "VOL"
                },
                {
                    "nome": "Willian Farias",
                    "camisa": 17,
                    "posicao": "VOL"
                },
                {
                    "nome": "Nenê",
                    "camisa": 10,
                    "posicao": "MEC"
                },
                {
                    "nome": "Everton Felipe",
                    "camisa": 18,
                    "posicao": "MEC"
                },
                {
                    "nome": "Helinho",
                    "camisa": 11,
                    "posicao": "ATA"
                },
                {
                    "nome": "Brenner",
                    "camisa": 30,
                    "posicao": "ATA"
                }]
            },
            "timeVisitante": {
                "tecnico": "Eduardo Barroca",
                "esquema": "4-5-1",
                "jogadores": [{
                    "nome": "Gatito Fernández",
                    "camisa": 1,
                    "posicao": "GOL"
                },
                {
                    "nome": "Marcinho",
                    "camisa": 4,
                    "posicao": "LAD"
                },
                {
                    "nome": "Joel Carli",
                    "camisa": 3,
                    "posicao": "ZAD"
                },
                {
                    "nome": "Gabriel",
                    "camisa": 2,
                    "posicao": "ZAE"
                },
                {
                    "nome": "Jonathan",
                    "camisa": 6,
                    "posicao": "LAE"
                },
                {
                    "nome": "Gustavo Bochecha",
                    "camisa": 5,
                    "posicao": "VOL"
                },
                {
                    "nome": "Wenderson",
                    "camisa": 7,
                    "posicao": "VOL"
                },
                {
                    "nome": "João Paulo",
                    "camisa": 10,
                    "posicao": "VOL"
                },
                {
                    "nome": "Cícero",
                    "camisa": 8,
                    "posicao": "MEC"
                },
                {
                    "nome": "Rodrigo Pimpão",
                    "camisa": 9,
                    "posicao": "MEC"
                },
                {
                    "nome": "Erik",
                    "camisa": 11,
                    "posicao": "ATA"
                }],
                "reservas": [{
                    "nome": "Diego Cavalieri",
                    "camisa": 12,
                    "posicao": "GOL"
                },
                {
                    "nome": "Fernando",
                    "camisa": 13,
                    "posicao": "LAD"
                },
                {
                    "nome": "Marcelo Benevenuto",
                    "camisa": 14,
                    "posicao": "ZAD"
                },
                {
                    "nome": "Helerson",
                    "camisa": 23,
                    "posicao": "ZAD"
                },
                {
                    "nome": "Gilson",
                    "camisa": 15,
                    "posicao": "LAE"
                },
                {
                    "nome": "Alan Santos",
                    "camisa": 16,
                    "posicao": "VOL"
                },
                {
                    "nome": "Jean",
                    "camisa": 21,
                    "posicao": "VOL"
                },
                {
                    "nome": "Rickson",
                    "camisa": 22,
                    "posicao": "VOL"
                },
                {
                    "nome": "Igor Cássio",
                    "camisa": 18,
                    "posicao": "ATA"
                },
                {
                    "nome": "Leonardo Valencia",
                    "camisa": 20,
                    "posicao": "MEC"
                },
                {
                    "nome": "Luiz Fernando",
                    "camisa": 17,
                    "posicao": "MEC"
                },
                {
                    "nome": "Gustavo Ferrareis",
                    "camisa": 19,
                    "posicao": "MEC"
                }]
            }
        }
        """.data(using: .utf8)!
    }
    
    static func lancesJogoSelecionado() -> Data{
        """
        [
            {
                "tempo": 1,
                "minuto": 4,
                "tipo": "AMARELO",
                "nomeJogador": "Anderson Martins",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                "posicao": "Zagueiro Esquerdo"
            },
            {
                "tempo": 1,
                "minuto": 7,
                "tipo": "GOL",
                "nomeJogador": "Berrío",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Atacante"
            },
            {
                "tempo": 1,
                "minuto": 24,
                "tipo": "AMARELO",
                "nomeJogador": "Lincoln",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Atacante"
            },
            {
                "tempo": 1,
                "minuto": 26,
                "tipo": "AMARELO",
                "nomeJogador": "Thuler",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Zagueiro Direito"
            },
            {
                "tempo": 1,
                "minuto": 30,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Alexandre Pato",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                "posicao": "Atacante",
                "novo_jogador": "Everton",
                "nova_posicao": "Meia Central"
            },
            {
                "tempo": 1,
                "minuto": 40,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Anderson Martins",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                "posicao": "Zagueiro Esquerdo",
                "novo_jogador": "Hernanes",
                "nova_posicao": "Volante"
            },
            {
                "tempo": 1,
                "minuto": 46,
                "tipo": "VERMELHO",
                "nomeJogador": "Ronaldo",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Volante"
            },
            {
                "tempo": 1,
                "minuto": 48,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Berrío",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Atacante",
                "novo_jogador": "Lucas Silva",
                "nova_posicao": "Atacante"
            },
            {
                "tempo": 2,
                "minuto": 18,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Matheus Dantas",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Zagueiro Direito",
                "novo_jogador": "Rafael",
                "nova_posicao": "Zagueiro Esquerdo"
            },
            {
                "tempo": 2,
                "minuto": 19,
                "tipo": "AMARELO",
                "nomeJogador": "Diego",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Meia Central"
            },
            {
                "tempo": 2,
                "minuto": 25,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Lincoln",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Atacante",
                "novo_jogador": "Bruno Henrique",
                "nova_posicao": "Atacante"
            },
            {
                "tempo": 2,
                "minuto": 32,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Reinaldo",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                "posicao": "Lateral Esquerda",
                "novo_jogador": "Helinho",
                "nova_posicao": "Atacante"
            },
                        {
                "tempo": 2,
                "minuto": 37,
                "tipo": "GOL",
                "nomeJogador": "Tchê Tchê",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                "posicao": "Volante"
            },
            {
                "tempo": 2,
                "minuto": 39,
                "tipo": "AMARELO",
                "nomeJogador": "Trauco",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Lateral Esquerda"
            },
            {
                "tempo": 2,
                "minuto": 43,
                "tipo": "AMARELO",
                "nomeJogador": "Rodinei",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Lateral Direito"
            },
            {
                "tempo": 2,
                "minuto": 46,
                "tipo": "AMARELO",
                "nomeJogador": "Rafael",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                "posicao": "Zagueiro Esquerdo"
            },
            {
                "tempo": 2,
                "minuto": 52,
                "tipo": "FIMJOGO",
                "nomeJogador": "",
                "urlEscudo": "",
                "posicao": ""
            }
        ]
        """.data(using: .utf8)!
    }
}
