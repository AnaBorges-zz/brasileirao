//
//  MockJson.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/19/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

enum MockJson{

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
    
    static func jogoSelecionadoJson() -> Data{
    """
        {
            "id": 2,
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
        }
    """.data(using: .utf8)!
    }
    
    static func lancesJogoSelecionadoJson() -> Data{
        """
           [{
                "tempo": 1,
                "minuto": 22,
                "tipo": "VERMELHO",
                "nomeJogador": "Rodrigo Pimpão",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2019/02/04/botafogo-65.png",
                "posicao": "Atacante"
            },
            {
                "tempo": 1,
                "minuto": 40,
                "tipo": "GOL",
                "nomeJogador": "Everton",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2014/04/14/sao_paulo_60x60.png",
                "posicao": "Meia Central"
               
            },
            {
                "tempo": 2,
                "minuto": 11,
                "tipo": "SUBSTITUICAO",
                "nomeJogador": "Wenderson",
                "urlEscudo": "https://s.glbimg.com/es/sde/f/organizacoes/2019/02/04/botafogo-65.png",
                "posicao": "Volante",
                "novo_jogador": "Luiz Fernando",
                "nova_posicao": "Meia Central"
            }]
        """.data(using: .utf8)!
    }
}
