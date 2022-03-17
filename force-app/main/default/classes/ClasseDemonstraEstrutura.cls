public with sharing class ClasseDemonstraEstrutura {

    /* DESAFIO - Montar um método que busque e retorne uma lista com todas 
    as oportunidade com a faze igual  'Closed Won' */
    public static List<Opportunity> findOpportunity(){
        List<Opportunity> oppList = new List<Opportunity>([SELECT Name FROM opportunity WHERE StageName = 'Closed Won' LIMIT 2]);
        System.debug('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
        for(Opportunity opp : oppList){
            System.debug(opp);
        }
        System.debug('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

        return oppList;
    }

    /*DESAFIO - Receber o sobrenome e o nome da empresa e 
    vamos inserir um Lead, o método deve retornar o 
    Id do lead inserido*/
    public static Id inserirLead(String sobrenome, String nomeEmpresa) {
        Lead lead = new Lead();
        lead.LastName = sobrenome;
        lead.Company = nomeEmpresa;

        insert lead;

        System.debug(lead.Id);
        return lead.Id;
    }

    /*
    //DESAFIO
    //Construir um método que receba dois parâmetros do tipo Inteiro e retorne o a soma destes dois parâmetros
    //Se o parâmetro 1 for maior do 5 deve somar mais dois neste resultado
    */
    public static Integer somaParametros(Integer valor1, Integer valor2) {
        
        Integer valorSoma = valor1 + valor2;
        system.debug('SOMA: ' + valorSoma );

        if( valor1 > 5) {
            system.debug( 'será somado +2 no total pois o primeiro parametro('+valor1+') é maior que 5...');
            valorSoma = valorSoma + 2;
            system.debug('NOVA SOMA: ' + valorSoma);
        }
        
        return valorSoma;
    }

    public static Integer testaMetodo(){
        Integer retornoDoMetodo = ClasseDemonstraEstrutura.somaParametros(8,2);
        system.debug('VALOR DO METODO "testaMetodo()" : ' + retornoDoMetodo);

        return retornoDoMetodo;
    }

    /*public static Account dmlAccountUpdate(String name, String idDaConta) {
        List<Account>  accountList = new List<Account>([]);
    }*/

    /*public static Decimal getOpportinitiesTotal(){
        Decimal total = 0;
        List<Opportunity> opportunityList = new List<Opportunity>([SELECT Amount FROM opportunity]);
        for(Opportunity opp : opportunityList) {
        }        
        return total;
    }*/
    


    //DESAFIO
    //1 - Buscar e retornar o valor total das oportunidade que a fases não sejam 'Closed Won' e 'Closed Lost'
    public static Decimal totalOpportunities() {
        Decimal totalOpp = 0;
        List<Opportunity> oppList = new List<Opportunity>([SELECT StageName, Amount FROM opportunity]);

        for(Opportunity opp : oppList) {
            if( opp.StageName != 'Closed Won' && opp.StageName != 'Closed Lost' ) {
                totalOpp += opp.Amount;
            }
        }
        
        system.debug('TOTAL: ' + totalOpp);
        return totalOpp;
    }

    //DESAFIO
    //2 - Criar 10 contas com o nome 'Conta 1', 'Conta 2', e assim por diante. Não retornar nada
    public static void criarContas(){
        List<Account> accList = new List<Account>();
        for( Integer i=1; i <= 10; i++ ) {
            Account acc = new Account();
            acc.Name = 'Conta ' + i;
            accList.add(acc);
        }
        insert accList;
    }

    //DESAFIO 
    //3- Receber um número inteiro no parâmetro, e vão criar as contas conforme este 
    //número com o nome 'Conta DESAFIO 1', 'Conta DESAFIO 2';
    public static void criaContas2(Integer qtd){
        List<Account> accList = new List<Account>();
        
        if(qtd != 0){
            for(Integer i=1; i<= qtd; i++){
                Account acc = new Account();
                acc.Name = 'Conta Desafio ' + i;
                accList.add(acc);
            }

            if( accList.size() > 0 ){
                insert accList;
            }
        }
    }
}
